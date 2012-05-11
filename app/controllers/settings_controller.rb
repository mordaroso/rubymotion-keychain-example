class SettingsController < UIViewController
  def loadView
    self.view = SettingsView.alloc.init
    self.view.setNeedsDisplay
  end
end
