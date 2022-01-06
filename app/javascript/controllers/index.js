// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import MenuController from "./menu_controller.js"
application.register("menu", MenuController)

import NewPaymentMethodController from "./new_payment_method_controller.js"
application.register("new-payment-method", NewPaymentMethodController)
