from IPython.terminal.prompts import Prompts, Token

c = get_config()
# c.TerminalIPythonApp.display_banner = False
c.TerminalInteractiveShell.confirm_exit = False

class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
         return [(Token.Prompt, '>>> ')]
    def out_prompt_tokens(self):
        return [(Token.Prompt,  '  ')]

c.TerminalInteractiveShell.prompts_class = MyPrompt