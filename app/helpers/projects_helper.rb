module ProjectsHelper
  def big_screenshot_for(project)
    if project.screenshot
      image_tag project.screenshot.file.big.url
    else
      image_tag 'fallback/big_screenshot.jpg'
    end
  end
  def thumb_screenshot_for(project)
    if project.screenshot
      image_tag project.screenshot.file.thumb.url
    else
      image_tag 'fallback/thumb_screenshot.jpg'
    end
  end
end
