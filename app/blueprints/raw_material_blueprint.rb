# frozen_string_literal: true

class RawMaterialBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
      fields :name, :weight
    end
end
