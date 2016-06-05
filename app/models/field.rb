class Field < ApplicationRecord

  belongs_to :field_consumer, polymorphic: true, optional: true

  validate :regex_validation
  validate :mandatory_validation

  def regex_validation
    if (value.present? && validate_regex.present? && !Regexp.new(validate_regex.to_s).match(value.to_s))
      errors.add method,
        ( validate_invalid_message || "is invalid (Failed to match `#{value}` with regex /#{validate_regex}/.)" ),
        cname: 'hi'
      # I18n.backend.store_translations(:en, {test: "YOOOOOHHHHHOOOO"})
    end
  end

  def mandatory_validation
    if required && value.blank?
      errors.add :value, [ label, "can't be blank" ]
    end
  end

end
