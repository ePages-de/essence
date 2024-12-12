// Import and register all your controllers from the importmap under controllers/*

import { application } from "./controllers/application"

import ParagraphComponentController from 'components/essence/paragraph_component/paragraph_component_controller'
application.register('paragraph', ParagraphComponentController)

import ClipboardCopyComponentController from 'components/essence/clipboard_copy_component/clipboard_copy_component_controller'
application.register('clipboard-copy', ClipboardCopyComponentController)

import ExpandableComponentController from 'components/essence/expandable_component/expandable_component_controller'
application.register('expandable', ExpandableComponentController)

import TooltipComponentController from 'components/essence/tooltip_component/tooltip_component_controller'
application.register('tooltip', TooltipComponentController)
