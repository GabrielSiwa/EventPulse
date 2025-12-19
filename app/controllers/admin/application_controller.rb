module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_admin!

    private

    def authenticate_admin!
      require "digest"
      admin_user = ENV.fetch("ADMIN_USER")
      admin_pass = ENV.fetch("ADMIN_PASS")

      authenticate_or_request_with_http_basic("Admin Area") do |u, p|
        user_ok = ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(u.to_s), Digest::SHA256.hexdigest(admin_user.to_s))
        pass_ok = ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(p.to_s), Digest::SHA256.hexdigest(admin_pass.to_s))
        user_ok & pass_ok
      end
    end
  end
end
