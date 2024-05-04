# frozen_string_literal: true

class OrderBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :car_number, :requested_date, :received_date, :extraction_start_date, :emptied_date, :released_date, :weight
        association :raw_material, blueprint: RawMaterialBlueprint, view: :normal
    end
end
