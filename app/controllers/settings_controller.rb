class SettingsController < UIViewController
  def loadView
    self.view = SettingsView.alloc.init
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor
    self.view.setNeedsDisplay
  end
end
