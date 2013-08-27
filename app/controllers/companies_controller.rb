class CompaniesController < ApplicationController
  
  def index
  	require 'nokogiri'
  
  	#resp = open("http://wwwinfo.mfcr.cz/cgi-bin/ares/darv_bas.cgi?#{params[:ico]}")

  	#@xml_doc = Nokogiri::XML(resp.read)
  	@xml_doc = Nokogiri::XML(open("http://wwwinfo.mfcr.cz/cgi-bin/ares/darv_bas.cgi?ico=#{params[:company_search][:ico]}&xml=0&ver=1.0.2"))
  	@status_main = @xml_doc.xpath("//dtt:Nadpis").text
  	@company_status = @xml_doc.xpath("//dtt:Stav_subjektu").text
  	@company_ico = @xml_doc.xpath("//dtt:ICO").text
  	@company_datum = @xml_doc.xpath("//dtt:Datum_zapisu_OR").text
  	@company_name = @xml_doc.xpath("//dtt:Obchodni_firma").text
  	@company_type = @xml_doc.xpath("//dtt:Nazev_PF").text
  	@company_business = @xml_doc.xpath("//dtt:Text")
  end

  def create
  	#@company_search = CompanySearch.new(params[:company_search])
  end
end