Gnib
====

Gnib is a Ruby interface for Microsoft Bing Search API.

[![Build Status](https://secure.travis-ci.org/inbeom/gnib.png)](http://travis-ci.org/inbeom/gnib)

Installation
------------

### Rails 3.x users

For Rails 3.x projects, add the following line to your `Gemfile`.

    gem 'gnib'

### All Others

Install `gnib` gem with Rubygems.

    $ gem install gnib

Usage
-----

Obtain your Application key from [here] (https://ssl.bing.com/webmaster/developers/appids.aspx)

### Standalone

    Gnib.config.application_id = 'YOUR_APP_ID'
    results = Gnib::Search.get('Great', :sources => [:image])

### Rails 3.x

In initializers like `config/initializers/gnib.rb`, configure Gnib with
your Application key.

    Gnib.config.application_id = 'YOUR_APP_ID'

You can search items in your actions.

    @results = Gnib::Search.get('hello world', :sources => [:web, :image])

### (Not so much) More Complicated Usage Example

`Gnib::Search#get` is a helper function implemented to maximize
usability of the library. You can utilize `Gnib::Search`,
`Gnib::SearchRequest`, `Gnib::SearchResponse` instances which provide
more useful options than that of the helper function.

    search = Gnib::Search.new 'query', :sources => [:web, :image] # Other options include :market, :version, :adult, :latitude, :longitude, ...
    request = search.request
    response = request.response

    image_results = response.images # Image search results
    web_results = response.webs # Web search results

More descriptive documentations will be available soon. Stay tuned!

References
----------

 - [Bing Developer](http://www.bing.com/toolbox/bingdeveloper/)
