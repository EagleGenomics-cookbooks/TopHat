require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

describe command('which bowtie') do
  its(:exit_status) { should eq 0 }
end

%w(
  samtools_0.1.18
  prep_reads
  gtf_to_fasta
  fix_map_ordering
  bam2fastx
  segment_juncs
  gtf_juncs
  juncs_db
  long_spanning_reads
  bam_merge
  map2gtf
  tophat_reports
  sam_juncs
  tophat2
  tophat
  contig_to_chr_coords
  bed_to_juncs
  sra_to_solid
  tophat-fusion-post
).each do |file_executable|
  describe command("which #{file_executable}") do
    its(:exit_status) { should eq 0 }
  end
end

%w(
  tophat2
  tophat
).each do |file_executable|
  describe command("#{file_executable} -v") do
    its(:stdout) { should contain(ENV['TOPHAT_VERSION']) }
  end
end
