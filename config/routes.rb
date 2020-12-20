Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :sp do

    get   'auth/daftar'
    post  'auth/daftar'     => 'auth#daftar_post'
    get   'auth/masuk'
    post  'auth/masuk'      => 'auth#masuk_post'
    get   'auth/signout'

    get   'beranda'         => 'beranda#index'

    resource :databuku do
      collection do
        get    '/'                  => 'databuku#index'
        get    'baru'               => 'databuku#baru'
        post   'baru'               => 'databuku#baru_post'
        get    'edit/:databuku_id'  => 'databuku#edit'
        patch  'edit/:databuku_id'  => 'databuku#edit_post'
        get    'hapus/:databuku_id' => 'databuku#hapus'
        delete 'hapus/:databuku_id' => 'databuku#hapus'
        get    'view'               => 'databuku#view'
        get    'search'               => 'databuku#view'
      end
    end

    resource :anggota do
      collection do
        get    '/'                  => 'anggota#index'
        get    'baru'               => 'anggota#baru'
        post   'baru'               => 'anggota#baru_post'
        get    'edit/:anggota_id'  => 'anggota#edit'
        patch  'edit/:anggota_id'  => 'anggota#edit_post'
        get    'hapus/:anggota_id' => 'anggota#hapus'
        delete 'hapus/:anggota_id' => 'anggota#hapus'
        get    'view'               => 'anggota#view'
        get    'search'            => 'anggota#search'
      end
    end

    resource :peminjaman do
      collection do
        get    '/'                  => 'peminjaman#index'
        get    'baru'               => 'peminjaman#baru'
        post   'baru'               => 'peminjaman#baru_post'
        get    'edit/:peminjaman_id'  => 'peminjaman#edit'
        patch  'edit/:peminjaman_id'  => 'peminjaman#edit_post'
        get    'hapus/:peminjaman_id' => 'peminjaman#hapus'
        delete 'hapus/:peminjaman_id' => 'peminjaman#hapus'
        get    'view'               => 'peminjaman#view'
      end
    end

    resource :pengembalian do
      collection do
        get    '/'                  => 'pengembalian#index'
        get    'baru'               => 'pengembalian#baru'
        post   'baru'               => 'pengembalian#baru_post'
        get    'edit/:pengembalian_id'  => 'pengembalian#edit'
        patch  'edit/:pengembalian_id'  => 'pengembalian#edit_post'
        get    'hapus/:pengembalian_id' => 'pengembalian#hapus'
        delete 'hapus/:pengembalian_id' => 'pengembalian#hapus'
        get    'view'               => 'pengembalian#view'
      end
    end
  end
end
