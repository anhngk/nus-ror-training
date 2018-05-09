Why should we use it?
Dùng để quốc tế hóa/địa phương hóa ứng dụng RoR . VD như các message, date and time format

Setup Rails app for Internationalization

<en.yml>
  en:
    hello: "Hello"
Change default locale & configure the translations load paths in config/application.rb :

  config.i18n.default_locale = :vn

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

Check current language : I18n.locale

