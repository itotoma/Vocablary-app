# -*- encoding: utf-8 -*-
# stub: omniauth-yahoojp 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-yahoojp".freeze
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["mikanmarusan".freeze]
  s.date = "2019-03-01"
  s.description = "Official OmniAuth strategy for Yahoo! JAPAN.".freeze
  s.email = ["chiakifujimon@gmail.com".freeze]
  s.homepage = "https://github.com/mikanmarusan/omniauth-yahoojp".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.1".freeze
  s.summary = "Official OmniAuth strategy for Yahoo! JAPAN.".freeze

  s.installed_by_version = "3.0.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth>.freeze, [">= 1.0"])
      s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, [">= 1.1"])
      s.add_runtime_dependency(%q<httpauth>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.7"])
      s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
    else
      s.add_dependency(%q<omniauth>.freeze, [">= 1.0"])
      s.add_dependency(%q<omniauth-oauth2>.freeze, [">= 1.1"])
      s.add_dependency(%q<httpauth>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.7"])
      s.add_dependency(%q<rack-test>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<omniauth>.freeze, [">= 1.0"])
    s.add_dependency(%q<omniauth-oauth2>.freeze, [">= 1.1"])
    s.add_dependency(%q<httpauth>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.7"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
  end
end
