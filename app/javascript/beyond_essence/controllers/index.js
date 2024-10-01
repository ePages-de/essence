// Import and register all your controllers from the importmap under controllers/*

import { application } from "./controllers/application"

import ParagraphComponentController from 'components/beyond_essence/paragraph_component/paragraph_component_controller'
application.register('paragraph', ParagraphComponentController)

import ClipboardCopyComponentController from 'components/beyond_essence/clipboard_copy_component/clipboard_copy_component_controller'
application.register('clipboard-copy', ClipboardCopyComponentController)

import TooltipComponentController from 'components/beyond_essence/tooltip_component/tooltip_component_controller'
application.register('tooltip', TooltipComponentController)
