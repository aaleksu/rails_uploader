rails_uploader
==============

test ruby gem for file uploading (modificatins of rails fm)


Get started
------------

Add it to your Gemfile with:

<pre>
gem 'rails_uploader'
</pre>


Then execute init task:

<pre>
rake rails_uploader:init
</pre>


Usage
-----

Define uploadable attributes in your model:

<pre>
def uploadable_attributes
  %w[userpic]
end
</pre>
