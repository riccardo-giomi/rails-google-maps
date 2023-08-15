# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.base_uri :self
    policy.default_src :self, :https
    policy.connect_src :self, :https, 'maps.googleapis.com', 'maps.gstatic.com'
    policy.font_src    :self, :https, :data, 'fonts.gstatic.com'
    policy.img_src     :self, :https, :data, 'maps.gstatic.com', 'maps.googleapis.com'
    policy.object_src  :none
    policy.script_src  :strict_dynamic
    policy.style_src   :self, :https, 'fonts.googleapis.com'
    # Specify URI for violation reports
    # policy.report_uri "/csp-violation-report-endpoint"
  end

  # Generate session nonces for permitted importmap and inline scripts
  #
  # Note that this generator does not follow strict CSP policy, which requires a
  # new nonce per request.
  # This is a compromise to keep the Turbo Rails feature of content-only loading.
  # See https://github.com/rails/rails/pull/43227 for reference.
  config.content_security_policy_nonce_generator = ->(request) { request.session.id.to_s }

  config.content_security_policy_nonce_directives = %w[script-src style-src]

  # Report violations without enforcing the policy.
  # config.content_security_policy_report_only = true
end
