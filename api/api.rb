class Api < Grape::API
  include PadrinoGrape

  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  helpers do
    params :company do
      group :company, type: Hash do
        requires :name,    type: String, allow_blank: false
        requires :address, type: String, allow_blank: false
        requires :city,    type: String, allow_blank: false
        requires :country, type: String, allow_blank: false

        optional :email,   type: String, allow_blank: true
        optional :phone,   type: String, allow_blank: true
      end
    end

    params :employee do
      group :employee, type: Hash do
        requires :name,        type: String,  allow_blank: false
        requires :company_id,  type: Integer, allow_blank: false
        requires :position_id, type: Integer, allow_blank: false
      end
    end

    params :passport do
      group :passport, type: Hash do
        requires :employee_id, type: Integer, allow_blank: false
        requires :file,        type: Hash,    allow_blank: false
      end
    end
  end
end
