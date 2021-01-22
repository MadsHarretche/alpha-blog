// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//nedenstående fire linjer har jeg selv sat ind, da de også stod der på kurset.
//require("@rails/ujs").start()
//require("turbolinks").start()
//require("@rails/activestorage").start()
//require("channels").start()


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "bootstrap"
import * as ActiveStorage from "@rails/activestorage"
import "channels"



Rails.start()
Turbolinks.start()
ActiveStorage.start()
