class CalendarController < ApplicationController
  


def month_for_user
  @meetings = current_user.meetings
end

end