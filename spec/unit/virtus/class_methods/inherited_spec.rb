require 'spec_helper'

describe Virtus::ClassMethods, '#inherited' do
  subject { Class.new(object) }

  let(:object) { Class.new { extend Virtus::ClassMethods } }

  it 'includes an AttributesAccessor module' do
    descendant = subject

    # return the descendant's attribute accessor modules (superclass + own)
    modules = descendant.ancestors.grep(Virtus::AttributesAccessor)
    modules.size.should be(2)

    # remove the superclass' attribute accessor module
    modules -= object.ancestors.grep(Virtus::AttributesAccessor)

    # the descendant should have it's own attribute accessor module
    modules.size.should be(1)
  end
end
