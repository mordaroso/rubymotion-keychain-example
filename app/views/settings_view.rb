class SettingsView < UIView

  def initWithFrame(rect)
    if super
      self.backgroundColor = UIColor.groupTableViewBackgroundColor
      @user = UIApplication.sharedApplication.delegate.user
      drawUsername
      drawPassword
      drawButton
    end
    self
  end

  def drawUsername
    @username = UITextField.alloc.initWithFrame CGRectMake(40, 30, 240, 30)
    @username.setBorderStyle UITextBorderStyleRoundedRect
    @username.placeholder = 'Username'
    @username.text = @user.username
    @username.setReturnKeyType UIReturnKeyDone
    @username.addTarget self, action: 'textFieldFinished', forControlEvents:UIControlEventEditingDidEndOnExit

    addSubview @username
  end

  def drawPassword
    @password = UITextField.alloc.initWithFrame CGRectMake(40, 75, 240, 30)
    @password.setBorderStyle UITextBorderStyleRoundedRect
    @password.placeholder = 'Password'
    @password.text = @user.password
    @password.setSecureTextEntry true
    @password.setReturnKeyType UIReturnKeyDone
    @password.addTarget self, action: 'textFieldFinished', forControlEvents:UIControlEventEditingDidEndOnExit

    addSubview @password
  end

  def drawButton
    @saveButton = UIButton.buttonWithType UIButtonTypeRoundedRect
    @saveButton.setFrame CGRectMake(80, 130, 160, 40)
    @saveButton.setTitle "Save", forState: UIControlStateNormal

    pointer = Pointer.new(:object)

    @saveButton.addTarget self, action:'saveSettings', forControlEvents: UIControlEventTouchUpInside


    addSubview @saveButton
  end

  def textFieldFinished
    self.endEditing true
  end

  def saveSettings
    @user.username = @username.text
    @user.password = @password.text
    @user.save

    @saveButton.setTitle "Saved", forState: UIControlStateNormal
    self.endEditing true
  end
end