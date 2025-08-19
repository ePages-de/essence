// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import ButtonComponentController from 'components/essence/button_component/button_component_controller'
application.register('button', ButtonComponentController)

import ClipboardCopyComponentController from 'components/essence/clipboard_copy_component/clipboard_copy_component_controller'
application.register('clipboard-copy', ClipboardCopyComponentController)

import FlashComponentController from 'components/essence/flash_component/flash_component_controller'
application.register('flash', FlashComponentController)

import ParagraphComponentController from 'components/essence/paragraph_component/paragraph_component_controller'
application.register('paragraph', ParagraphComponentController)

import TooltipComponentController from 'components/essence/tooltip_component/tooltip_component_controller'
application.register('tooltip', TooltipComponentController)
