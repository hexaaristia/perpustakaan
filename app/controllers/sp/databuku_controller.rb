class Sp::DatabukuController < ApplicationController
  before_action :login_sp_required
  layout 'sp'
  before_action :atur_tampilan

  def index
    @datas = Databuku.all
  end

  # def search
  #   buku_judul = params[:buku_judul].to_s
  #   @data = Databuku.where(":buku_judul LIKE ?",  "%" + params[:q] + "%")
  # end

  def baru
    @data = Databuku.new
  end

  def baru_post
    databuku = params[:databuku]

    Databuku.create({
      buku_judul: databuku[:buku_judul],
      buku_penulis: databuku[:buku_judul],
      buku_penerbit: databuku[:buku_penerbit],
      buku_thnterbit: databuku[:buku_thnterbit]
      })

      redirect_to action: 'index'
  end

  def edit
    databuku_id = params[:databuku_id].to_i
    @data = Databuku.find(databuku_id)
  end

  def edit_post
    databuku = params[:databuku]
    @data = Databuku.find(params[:databuku_id])
    @data.buku_judul = databuku[:buku_judul]
    @data.buku_penulis = databuku[:buku_penulis]
    @data.buku_penerbit = databuku[:buku_penerbit]
    @data.buku_thnterbit = databuku[:buku_thnterbit]

    if @data.save
         flash[:notif] = "Berhasil disimpan"
         redirect_to action: 'index'
       else
         flash[:notif] = "Data tidak tersimpan"
         render 'edit'
       end
  end

  def view
    databuku = params[:databuku]
    @data = Databuku.find(params[:databuku_id])
  end

  def hapus
     if Databuku.find(params[:databuku_id].to_i).destroy
       flash[:notif] = "Berhasil dihapus"
       redirect_to action: 'index'
     else
       flash[:notif] = "Data gagal dihapus"
       render 'index'
     end
   end

   private
def atur_tampilan
  @judul_halaman = "Data Buku"
end

end
