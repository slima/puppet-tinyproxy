require 'spec_helper_acceptance'

describe 'install tinyproxy' do
  context 'default parameters with tinyproxy' do
    it 'should install package' do
      pp = "class { 'tinyproxy': }"

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
end
