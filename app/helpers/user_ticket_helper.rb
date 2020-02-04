module UserTicketHelper
  def ticket_status(status)
    return I18n.t('common.win') if status
    I18n.t('common.loss')
  end
end
