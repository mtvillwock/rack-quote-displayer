require 'spec_helper'

describe "QuoteDisplayer" do
  include Rack::Test::Methods

  let(:quoteapp) { QuoterApp.new }
  let(:app) { QuoteDisplayer.new(quoteapp) }

  context "when initialized" do
    it "reads quotes from fixtures directory" do
      expect(File.read("./spec/fixtures/rickygervais.txt")).to include "Piracy doesn't kill music, boy bands do."
    end

    it "supports being initalized with a mock session" do
      expect(Rack::MockRequest.new(app)).to be_truthy
    end

    it "supports being initialized with an app" do
      session = QuoteDisplayer.new(app)
      expect(session).to be_truthy
    end

    it "raises ArgumentError when no parameters passed" do
      expect{ QuoteDisplayer.new }.to raise_error(ArgumentError)
    end
  end

  describe "at GET request" do
    let(:request) { Rack::MockRequest.new(app) }
    let(:response) { request.get('/') }
    let(:invalidparam) { request.get('/gsw') }

    context "defaults" do
      it "to GET" do
        expect(response).to be_truthy
      end

      it "do not follow redirects" do
        expect(invalidparam).to be_truthy
      end
    end

    context "with valid params" do
      it "is valid with a valid params"
      it "returns a quote as a text format"
      it "returns a single quote"
      it "returns a random quote" do
        expect(app.quotes).to include(response.body)
      end
    end

    context "with invalid params" do
      it "raises an error for invalid params"
      it "re-renders the get method"
    end
  end
end