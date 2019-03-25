require 'rspec'
require 'plivo'


describe 'SSML elements test' do
  it 'should succeed for <break> element' do
    resp = Plivo::XML::Response.new
    speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
    speak.addBreak(time: '3s')
    xml = Plivo::XML::PlivoXML.new(resp)
    puts xml.to_xml

    expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<Break time='3s'/></Speak></Response>")
  end

  it 'should succeed for <emphasis> element' do
    resp = Plivo::XML::Response.new
    speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
    speak.addEmphasis('test', level: 'strong')
    xml = Plivo::XML::PlivoXML.new(resp)
    puts xml.to_xml

    expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<Emphasis level='strong'>test</Emphasis></Speak></Response>")
  end

  describe 'test for <lang>' do
    it 'should succeed' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      speak.addLang('test', {xmllang: 'fr'})
      xml = Plivo::XML::PlivoXML.new(resp)
      puts xml.to_xml

      expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<Lang xml:lang='fr'>test</Lang></Speak></Response>")
    end

    it 'should raise xml exception if required attribute is not specified' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      expect{speak.addLang('test')}.to raise_error(Plivo::Exceptions::PlivoXMLError, 'xmllang attribute is a required attribute for lang')
    end
  end

  it 'should succeed for <p> element' do
    resp = Plivo::XML::Response.new
    speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
    speak.addP('test')
    xml = Plivo::XML::PlivoXML.new(resp)
    puts xml.to_xml

    expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<P>test</P></Speak></Response>")
  end

  describe 'test for <phoneme>' do
    it 'should succeed' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      speak.addPhoneme('test', ph: 'pɪˈkɑːn')
      xml = Plivo::XML::PlivoXML.new(resp)
      puts xml.to_xml

      expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<Phoneme ph='pɪˈkɑːn'>test</Phoneme></Speak></Response>")
    end

    it 'should raise xml exception if required attribute is not specified' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      expect{speak.addPhoneme('test')}.to raise_error(Plivo::Exceptions::PlivoXMLError, 'ph attribute is required for Phoneme')
    end
  end

  describe 'test for <prosody>' do
    it 'should succeed' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      speak.addProsody('test', volume: "loud")
      xml = Plivo::XML::PlivoXML.new(resp)
      puts xml.to_xml

      expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<Prosody volume='loud'>test</Prosody></Speak></Response>")
    end

    it 'should raise xml exception if required attribute is not specified' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      expect{speak.addProsody('test')}.to raise_error(Plivo::Exceptions::PlivoXMLError, 'Specify at least one attribute for Prosody tag')
    end
  end

  describe 'test for <sub>' do
    it 'should succeed' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      speak.addSub('test', alias: "new word")
      xml = Plivo::XML::PlivoXML.new(resp)
      puts xml.to_xml

      expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<Sub alias='new word'>test</Sub></Speak></Response>")
    end

    it 'should raise xml exception if required attribute is not specified' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      expect{speak.addSub('test')}.to raise_error(Plivo::Exceptions::PlivoXMLError, 'alias is a required attribute for sub element')
    end
  end



  describe 'test for <say-as>' do
    it 'should succeed' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      speak.addSayAs('test', "interpret-as" => "ghi")
      xml = Plivo::XML::PlivoXML.new(resp)
      puts xml.to_xml

      expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<SayAs interpret-as='ghi'>test</SayAs></Speak></Response>")
    end

    it 'should raise xml exception if required attribute is not specified' do
      resp = Plivo::XML::Response.new
      speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
      expect{speak.addSayAs('test')}.to raise_error(Plivo::Exceptions::PlivoXMLError, "interpret-as is a required attribute for say-as element")
    end
  end

  it 'should succeed for <s> element' do
    resp = Plivo::XML::Response.new
    speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
    speak.addS('test')
    xml = Plivo::XML::PlivoXML.new(resp)
    puts xml.to_xml

    expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<S>test</S></Speak></Response>")

  end

  it 'should succeed for <w> element' do
    resp = Plivo::XML::Response.new
    speak = resp.addSpeak('Test Call', voice: 'Polly.Salli')
    speak.addW('test', role: 'attribute')
    xml = Plivo::XML::PlivoXML.new(resp)
    puts xml.to_xml

    expect(xml.to_xml).to eql("<?xml version=\"1.0\" encoding=\"utf-8\" ?><Response><Speak voice='Polly.Salli'>Test Call<W role='attribute'>test</W></Speak></Response>")
  end
end

describe "test for speak element" do
  it "should raise xml exception for: if voice is MAN/WOMAN, SSML is not supported" do
    resp = Plivo::XML::Response.new
    speak = resp.addSpeak('Test Call', voice: 'MAN')
    expect{speak.addP('test')}.to raise_error(Plivo::Exceptions::PlivoXMLError, 'P not nestable in Speak')
  end

  it 'should raise xml exception for: if voice attribute is not specified, SSML is not supported' do
    resp = Plivo::XML::Response.new
    speak = resp.addSpeak('Test Call')
    expect{speak.addP('test')}.to raise_error(Plivo::Exceptions::PlivoXMLError, 'P not nestable in Speak')
  end

  it 'should raise xml exception, if specified engine is not supported' do
    resp = Plivo::XML::Response.new
    expect{resp.addSpeak('Test Call', voice: 'Invalid.Salli')}.to raise_error(Plivo::Exceptions::PlivoXMLError, '<Speak> voice Invalid.Salli is not valid.')
  end

  it 'should raise xml exception, if specified voice is not supported' do
    resp = Plivo::XML::Response.new
    expect{resp.addSpeak('Test Call', voice: 'Polly.Invalid')}.to raise_error(Plivo::Exceptions::PlivoXMLError, '<Speak> voice Polly.Invalid is not valid.')
  end
end