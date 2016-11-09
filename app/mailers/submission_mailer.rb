class SubmissionMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def submission_email(submission)
    @submission = submission
    mail(to: @submission.email, subject: 'Thank you for your submission')
  end
end
