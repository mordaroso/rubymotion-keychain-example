describe "User" do
  before do
    @user = User.new
    @user.username = 'Username'
    @user.password = 'Secret'
    @user.save
  end

  it "should save username and password" do
    @user.username = 'New Username'
    @user.password = 'New Secret'
    @user.save

    @user.username.should == 'New Username'
    @user.password.should == 'New Secret'
  end

  it "should load username and password" do
    @second_user_object = User.new
    @user.username.should == 'Username'
    @user.password.should == 'Secret'
  end

  it "should reset information" do
    @user.reset
    @user.load
    @user.username.should == ''
    @user.username.should == ''
  end
end
