require 'logger'

RSpec.describe LogMarker do
  it 'can call' do
    $stdout = StringIO.new
    %w(ml p! pp! puts!).first(1).each do |m|
      send(m, 'something')

      output = $stdout.string.strip

      expect(output.start_with?(LogMarker.marker.call)).to eq(true)
      expect(output.end_with?(LogMarker.marker.call)).to eq(true)
    end
  end

  context 'with custom marker' do
    before do
      LogMarker.config do |c|
        c.marker = 'CUSTOM_MARKER'
      end
    end

    it 'Wraped custom marker' do
      $stdout = StringIO.new
      %w(ml p! pp! puts!).first(1).each do |m|
        send(m, 'something')

        output = $stdout.string.strip

        expect(output.start_with?('CUSTOM_MARKER')).to eq(true)
        expect(output.end_with?('CUSTOM_MARKER')).to eq(true)
      end
    end
  end
end
