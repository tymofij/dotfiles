c = get_config()

c.InteractiveShell.confirm_exit = False

# that does not seem to work
#c.TerminalIPythonApp.nosep = True

c.InteractiveShell.separate_in = ''
c.InteractiveShell.separate_out = ''
c.InteractiveShell.separate_out2 = ''


c.PromptManager.in_template  = '>>> '
c.PromptManager.in2_template = ''
c.PromptManager.out_template = ' '

