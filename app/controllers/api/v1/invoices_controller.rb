require 'prawn'
require 'prawn/table'

module Api
 module V1    
    class InvoicesController < ApplicationController
      before_action :authenticate_user_from_token!
      before_action :current_user


      def show
        @order = @current_user.orders.find_by(id: params[:id])
        if @order.present?
            @invoice = @order.invoice
            pdf_path = generate_pdf(@invoice)
            send_file(pdf_path, filename: "invoice_#{@invoice.invoice_number}.pdf",
                            type: "application/pdf",
                            disposition: "inline") # Use inline disposition to display in browser
        else
            render json: { error: 'order not found.' }, status: :unprocessable_entity if !@order.present?
        end
      end
      
      private
      
      def generate_pdf(invoice)
        pdf_path = Rails.root.join('tmp', "invoice_#{invoice.invoice_number}.pdf")
        Prawn::Document.generate(pdf_path) do |pdf|
          # Add a header with a company logo at the top middle
          pdf.bounding_box([pdf.bounds.width / 2 - 50, pdf.bounds.top], width: 100, height: 50) do
            pdf.image Rails.root.join('app', 'assets', 'images', 'PL-Teal.png'), width: 100
          end
          
          pdf.move_down 25
          
          pdf.font_size 18
          pdf.text "Invoice ##{invoice.invoice_number}", align: :center
          pdf.move_down 20
          
          pdf.font_size 12
          pdf.text "Date: #{invoice.date.strftime('%B %d, %Y')}", align: :left
          pdf.text "Customer: #{invoice.user.title} #{invoice.user.first_name} #{invoice.user.last_name}", align: :left
          pdf.move_down 10
          
          headers = ['Item', 'Quantity', 'Price']
          items = invoice.invoice_items.map { |item| [item.name, item.quantity, "#{item.price}"] }
          
          pdf.table [headers] + items, header: true, width: pdf.bounds.width do
            row(0).font_style = :bold
            cells.padding = 5
            cells.borders = [:top, :bottom, :left, :right]
            columns(0).width = 300
          end
      
          discount_amount = invoice.order.discount_amount
          shipping_fee = invoice.order.shipping_fee
          tax_amount = 0
          total_payable = invoice.order.total_amount
          
          pdf.move_down 20
          pdf.text "Delivery Date:  #{invoice.order.delivery_date}", align: :left
          pdf.text "Total items:  #{invoice.invoice_items.count}", align: :right
          pdf.text "Discount Amount:  #{discount_amount}", align: :right
          pdf.text "Shipping fee:  #{shipping_fee}", align: :right
          pdf.text "Tax:  #{tax_amount}", align: :right
          pdf.text "Total Payable Amount:  #{total_payable}", align: :right
          
          # Add footer
          pdf.repeat :all do
            pdf.font_size 10
            pdf.fill_color "333333" # Darker color (hex)
            pdf.text "Generated by Ground & Pound", align: :center, valign: :bottom
            pdf.fill_color "000000" # Reset color to black
            pdf.number_pages "<page> / <total>", at: [pdf.bounds.right - 50, 0], width: 50, align: :right
          end
        end
        pdf_path
      end
      
    end
 end
end
