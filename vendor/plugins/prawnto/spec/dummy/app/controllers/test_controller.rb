class TestController < ApplicationController

  def default_render
    @x = 1
    render :action => "default_render"
  end

  def dsl_render
    @x = 1
    render :action => "dsl_render"
  end

  def instance_var_test
    @x = 1
    render :action => "instance_var_test"
  end

  def yield_block_in_helper_test
    render :action => "yield_block_in_helper_test"
  end

  def partial_render
    @x = 1
    render :action => "partial_render"
  end

  def filename_test
    prawnto :filename => "fancy_name.pdf", :inline => false
    render :action => "default_render"
  end

end
