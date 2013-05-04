class EndViewController <RViewController

  def loadView
    super

    q_n_a = RLabel.bold_label_at center_frame_with_size([300, 100]), 'Q&A'
    self.view << q_n_a

    label = RLabel.label_at [[600, 720], [400, 20]], 'Back icon designed by SuperAtic LABS from The Noun Project'
    label.font = :small.uifont
    label.textAlignment = NSTextAlignmentRight
    self.view << label
  end

end