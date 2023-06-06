# frozen_string_literal: true

module Rswag
  module Ui
    module CSP
      # TODO: - remove connect-src 'self' http://127.0.0.1:3000; once deployed
      def call(env)
        _, headers, = response = super
        headers["Content-Security-Policy"] = <<~POLICY.gsub "\n", " "
          default-src 'self';
          connect-src 'self' http://127.0.0.1:3000;
          img-src 'self' data: https://online.swagger.io;
          font-src 'self' https://fonts.gstatic.com;
          style-src 'self' 'unsafe-inline' https://fonts.googleapis.com;
          script-src 'self' 'unsafe-inline' 'unsafe-eval';
        POLICY
        response
      end
    end
  end
end

Rswag::Ui::Middleware.prepend Rswag::Ui::CSP
