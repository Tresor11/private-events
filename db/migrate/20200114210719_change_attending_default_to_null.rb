class ChangeAttendingDefaultToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :attending, from: false, to: nil
  end
end
