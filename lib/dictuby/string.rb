
class String
    def normalize
        I18n.transliterate(self)
    end

    def normalize!
        replace(I18n.transliterate(self))
    end
end
