require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'sysctl class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'chronyd':
      }

      chronyd::server { 'pool':
        servers => [ '0.rhel.pool.ntp.org' ],
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file('/etc/chrony.conf') do
      it { should be_file }
      its(:content) { should match 'puppet managed file' }
      its(:content) { should match 'server 0.rhel.pool.ntp.org iburst' }
    end

  end
end
