<?php

namespace Database\Seeders;

use App\Models\Admins;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AdminTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $adminRecords=
        [
            'fname'=>'admin',
            'lname'=>'admin1',
            'country'=>'uganda',
            'address'=>'740 Kampala',
            'city'=>'Kampala',
            'state'=>'Central',
            'pincode'=>'001',
            'type'=>'superadmin',
            'photo'=>'',
            'vendor_id'=>'0',
            'mobile'=>'0776958181',
            'email'=>'admin@ecommerce.com',
            'password'=>'$2y$10$Iw/1QOZsdCqTNQMrAQQVIOedW.wWy/cnfSr9uE.vdZhLN7D0eGuyO',
            'status'=>'1',

        ];
        Admins::insert($adminRecords);
    }
}
