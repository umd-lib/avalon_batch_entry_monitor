class BatchEntriesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_query_params, only: [:index]

  def index
    params[:page] ||= 0
    @entries = BatchEntries.where('created_at >= ? AND created_at <= ?',
                                  @start_time, @end_time)
                           .page(@page).per(@per_page).order(@sort)
    respond_to do |format|
      format.html
      format.json { render json: @entries.as_json }
    end
  end

  # we just use this to update status of BatchEntries
  # But We can only cancel things that have been Queued.
  def cancel
    ids = params[:ids]
    BatchEntries.where(id: ids, current_status: "Queued").update_all(current_status: "Canceled")
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def set_query_params
      @per_page = params[:per_page] || 25
      @page = params[:page] || 1
      @start_time = parse_time_params(params[:start_time], Time.zone.now.advance(days: -1))
      @end_time = parse_time_params(params[:end_time])
      @sort = (params[:sort] || 'created_at').intern
    end

    # helper to parse the start/end time params. If there's a problem, return a
    # 'backup' to be used for query.
    def parse_time_params(time, backup = Time.zone.now)
      Time.parse(time || "").getlocal
    rescue ArgumentError
      return backup
    end
end
