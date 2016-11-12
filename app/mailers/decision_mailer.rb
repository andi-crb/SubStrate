class DecisionMailer < ApplicationMailer
    default from: "from@example.com"
  def acceptance_email(submission)
    @submission = submission
    mail(to: @submission.email, subject: 'Submission Response')
  end
  def hold_email(submission)
    @submission = submission
    mail(to: @submission.email, subject: 'Submission Response')
  end
  def reject_email(submission)
    @submission = submission
    mail(to: @submission.email, subject: 'Submission Response')
  end
end
