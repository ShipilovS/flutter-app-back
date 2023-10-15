require 'pagy/extras/overflow'
require 'pagy/extras/metadata'

Pagy::DEFAULT[:items] = 10
Pagy::DEFAULT[:metadata] = [ :count, :page, :items, :pages, :last, :prev, :next ]
