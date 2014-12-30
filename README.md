rails_uploader
==============

test ruby gem for file uploading (modificatins of rails fm)


Get started
------------

Add it to your Gemfile with:

<pre>
gem 'rails_uploader', :git => 'https://github.com/aaleksu/rails_uploader.git'
</pre>


Then execute init task:

<pre>
rake rails_uploader:init
</pre>


Usage
-----

Define directory to upload in config/initializers/rails_uploader.rb


Define uploadable attributes in your model:

<pre>
def uploadable_attributes
  %w[userpic]
end
</pre>
