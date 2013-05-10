class EndViewController <RViewController

  def loadView
    super

    demo = RLabel.bold_label_at center_frame_with_size([300, 100]), 'demo'
    self.view << demo

    skull_copyright = make_label [[600, 700], [400, 20]], 'Skull designed by Cameron Pinegar from The Noun Project'
    self.view << skull_copyright

    back_copyright = make_label [[600, 720], [400, 20]], 'Back icon designed by SuperAtic LABS from The Noun Project'
    self.view << back_copyright
  end

  def make_label(frame, text)
    label = RLabel.label_at frame, text
    label.font = :small.uifont
    label.textAlignment = NSTextAlignmentRight
    label
  end

end