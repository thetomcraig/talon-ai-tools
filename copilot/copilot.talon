app: vscode
not tag: user.codeium
-
pilot jest: user.vscode("editor.action.inlineSuggest.trigger")
pilot next: user.vscode("editor.action.inlineSuggest.showNext")
pilot (previous | last): user.vscode("editor.action.inlineSuggest.showPrevious")
pilot yes: user.vscode("editor.action.inlineSuggest.commit")
pilot yes word: user.vscode("editor.action.inlineSuggest.acceptNextWord")
pilot no: user.vscode("editor.action.inlineSuggest.undo")
pilot cancel: user.vscode("editor.action.inlineSuggest.hide")
pilot block last: user.vscode("workbench.action.chat.previousCodeBlock")
pilot block next: user.vscode("workbench.action.chat.nextCodeBlock")
pilot new file <user.cursorless_ordinal_or_last>:
    user.copilot_focus_code_block(cursorless_ordinal_or_last)
    user.vscode("workbench.action.chat.insertIntoNewFile")
pilot copy <user.cursorless_ordinal_or_last>:
    user.copilot_focus_code_block(cursorless_ordinal_or_last)
    edit.copy()
pilot bring <user.cursorless_ordinal_or_last>:
    user.copilot_bring_code_block(cursorless_ordinal_or_last)
pilot bring <user.cursorless_ordinal_or_last> {user.makeshift_destination} <user.cursorless_target>:
    user.cursorless_command(makeshift_destination, cursorless_target)
    user.copilot_bring_code_block(cursorless_ordinal_or_last)
pilot chat [<user.prose>]$ | bar chat: user.copilot_chat(prose or "")
pilot new | chat new:
    user.vscode("workbench.action.chat.openInSidebar")
    sleep(200ms)
    user.vscode("workbench.action.chat.newChat")
pilot {user.copilot_slash_command} <user.cursorless_target> [to <user.prose>]$:
    user.cursorless_command("setSelection", cursorless_target)
    user.copilot_inline_chat(copilot_slash_command or "", prose or "")
pilot make [<user.prose>]: user.copilot_inline_chat("", prose or "")
