module ncdr_attrs_fetch
    use kinds
    use netcdf
    use ncdr_types
    use ncdr_state
    use ncdr_alloc_assert
    
    interface nc_diag_read_get_attr
        module procedure &
            nc_diag_read_id_get_attr_1d_byte, &
            nc_diag_read_id_get_attr_1d_short, &
            nc_diag_read_id_get_attr_1d_long, &
            nc_diag_read_id_get_attr_1d_float, &
            nc_diag_read_id_get_attr_1d_double, &
            nc_diag_read_id_get_attr_1d_string, &
            nc_diag_read_noid_get_attr_1d_byte, &
            nc_diag_read_noid_get_attr_1d_short, &
            nc_diag_read_noid_get_attr_1d_long, &
            nc_diag_read_noid_get_attr_1d_float, &
            nc_diag_read_noid_get_attr_1d_double, &
            nc_diag_read_noid_get_attr_1d_string
    end interface nc_diag_read_get_attr
    
    contains
        subroutine nc_diag_read_id_get_attr_1d_byte(file_ncdr_id, var_name, attr_name, attr_stor)
            integer, intent(in)                        :: file_ncdr_id
            character(len=*), intent(in)               :: var_name
            character(len=*), intent(in)               :: attr_name
            integer(i_byte), dimension(:), allocatable, intent(inout) :: attr_stor
            
            integer(i_long)                            :: var_index, attr_len, attr_type, file_ncid
                        
            call ncdr_check_ncdr_id(file_ncdr_id)
            
            file_ncid = ncdr_files(file_ncdr_id)%ncid
            call ncdr_check_ncdr_id(file_ncdr_id)
            
            var_index = nc_diag_read_id_assert_var(file_ncdr_id, var_name)
            call nc_diag_read_id_assert_attr(file_ncdr_id, var_index, attr_name, attr_type, attr_len)
            
            call nc_diag_read_assert_attr_type(attr_type, NF90_BYTE)
            
            call nc_diag_read_assert_dims(attr_stor, (/ attr_len /))
            
            call check(nf90_get_att(file_ncid, &
                    ncdr_files(file_ncdr_id)%vars(var_index)%var_id, &
                    attr_name, &
                    attr_stor))
        end subroutine nc_diag_read_id_get_attr_1d_byte
        
        subroutine nc_diag_read_noid_get_attr_1d_byte(var_name, attr_name, attr_stor)
            character(len=*), intent(in)             :: var_name
            character(len=*), intent(in)             :: attr_name
            integer(i_byte), dimension(:), allocatable, intent(inout) :: attr_stor
            
            call ncdr_check_current_ncdr_id
            call nc_diag_read_id_get_attr_1d_byte(current_ncdr_id, var_name, attr_name, attr_stor)
        end subroutine nc_diag_read_noid_get_attr_1d_byte
        
        subroutine nc_diag_read_id_get_attr_1d_short(file_ncdr_id, var_name, attr_name, attr_stor)
            integer, intent(in)                        :: file_ncdr_id
            character(len=*), intent(in)               :: var_name
            character(len=*), intent(in)               :: attr_name
            integer(i_short), dimension(:), allocatable, intent(inout) :: attr_stor
            
            integer(i_long)                            :: var_index, attr_len, attr_type, file_ncid
                        
            call ncdr_check_ncdr_id(file_ncdr_id)
            
            file_ncid = ncdr_files(file_ncdr_id)%ncid
            call ncdr_check_ncid(file_ncid)
            
            var_index = nc_diag_read_id_assert_var(file_ncdr_id, var_name)
            call nc_diag_read_id_assert_attr(file_ncdr_id, var_index, attr_name, attr_type, attr_len)
            
            call nc_diag_read_assert_attr_type(attr_type, NF90_SHORT)
            
            call nc_diag_read_assert_dims(attr_stor, (/ attr_len /))
            
            call check(nf90_get_att(file_ncid, &
                    ncdr_files(file_ncdr_id)%vars(var_index)%var_id, &
                    attr_name, &
                    attr_stor))
        end subroutine nc_diag_read_id_get_attr_1d_short
        
        subroutine nc_diag_read_noid_get_attr_1d_short(var_name, attr_name, attr_stor)
            character(len=*), intent(in)             :: var_name
            character(len=*), intent(in)             :: attr_name
            integer(i_short), dimension(:), allocatable, intent(inout) :: attr_stor
            
            call ncdr_check_current_ncdr_id
            call nc_diag_read_id_get_attr_1d_short(current_ncdr_id, var_name, attr_name, attr_stor)
        end subroutine nc_diag_read_noid_get_attr_1d_short
        
        subroutine nc_diag_read_id_get_attr_1d_long(file_ncdr_id, var_name, attr_name, attr_stor)
            integer, intent(in)                        :: file_ncdr_id
            character(len=*), intent(in)               :: var_name
            character(len=*), intent(in)               :: attr_name
            integer(i_long), dimension(:), allocatable, intent(inout) :: attr_stor
            
            integer(i_long)                            :: var_index, attr_len, attr_type, file_ncid
                        
            call ncdr_check_ncdr_id(file_ncdr_id)
            
            file_ncid = ncdr_files(file_ncdr_id)%ncid
            call ncdr_check_ncid(file_ncid)
            
            var_index = nc_diag_read_id_assert_var(file_ncdr_id, var_name)
            call nc_diag_read_id_assert_attr(file_ncdr_id, var_index, attr_name, attr_type, attr_len)
            
            call nc_diag_read_assert_attr_type(attr_type, NF90_INT)
            
            call nc_diag_read_assert_dims(attr_stor, (/ attr_len /))
            
            call check(nf90_get_att(file_ncid, &
                    ncdr_files(file_ncdr_id)%vars(var_index)%var_id, &
                    attr_name, &
                    attr_stor))
        end subroutine nc_diag_read_id_get_attr_1d_long
        
        subroutine nc_diag_read_noid_get_attr_1d_long(var_name, attr_name, attr_stor)
            character(len=*), intent(in)             :: var_name
            character(len=*), intent(in)             :: attr_name
            integer(i_long), dimension(:), allocatable, intent(inout) :: attr_stor
            
            call ncdr_check_current_ncdr_id
            call nc_diag_read_id_get_attr_1d_long(current_ncdr_id, var_name, attr_name, attr_stor)
        end subroutine nc_diag_read_noid_get_attr_1d_long
        
        subroutine nc_diag_read_id_get_attr_1d_float(file_ncdr_id, var_name, attr_name, attr_stor)
            integer, intent(in)                        :: file_ncdr_id
            character(len=*), intent(in)               :: var_name
            character(len=*), intent(in)               :: attr_name
            real(r_single), dimension(:), allocatable, intent(inout) :: attr_stor
            
            integer(i_long)                            :: var_index, attr_len, attr_type, file_ncid
                        
            call ncdr_check_ncdr_id(file_ncdr_id)
            
            file_ncid = ncdr_files(file_ncdr_id)%ncid
            call ncdr_check_ncid(file_ncid)
            
            var_index = nc_diag_read_id_assert_var(file_ncdr_id, var_name)
            call nc_diag_read_id_assert_attr(file_ncdr_id, var_index, attr_name, attr_type, attr_len)
            
            call nc_diag_read_assert_attr_type(attr_type, NF90_FLOAT)
            
            call nc_diag_read_assert_dims(attr_stor, (/ attr_len /))
            
            call check(nf90_get_att(file_ncid, &
                    ncdr_files(file_ncdr_id)%vars(var_index)%var_id, &
                    attr_name, &
                    attr_stor))
        end subroutine nc_diag_read_id_get_attr_1d_float
        
        subroutine nc_diag_read_noid_get_attr_1d_float(var_name, attr_name, attr_stor)
            character(len=*), intent(in)             :: var_name
            character(len=*), intent(in)             :: attr_name
            real(r_single), dimension(:), allocatable, intent(inout) :: attr_stor
            
            call ncdr_check_current_ncdr_id
            call nc_diag_read_id_get_attr_1d_float(current_ncdr_id, var_name, attr_name, attr_stor)
        end subroutine nc_diag_read_noid_get_attr_1d_float
        
        subroutine nc_diag_read_id_get_attr_1d_double(file_ncdr_id, var_name, attr_name, attr_stor)
            integer, intent(in)                        :: file_ncdr_id
            character(len=*), intent(in)               :: var_name
            character(len=*), intent(in)               :: attr_name
            real(r_double), dimension(:), allocatable, intent(inout) :: attr_stor
            
            integer(i_long)                            :: var_index, attr_len, attr_type, file_ncid
                        
            call ncdr_check_ncdr_id(file_ncdr_id)
            
            file_ncid = ncdr_files(file_ncdr_id)%ncid
            call ncdr_check_ncid(file_ncid)
            
            var_index = nc_diag_read_id_assert_var(file_ncdr_id, var_name)
            call nc_diag_read_id_assert_attr(file_ncdr_id, var_index, attr_name, attr_type, attr_len)
            
            call nc_diag_read_assert_attr_type(attr_type, NF90_DOUBLE)
            
            call nc_diag_read_assert_dims(attr_stor, (/ attr_len /))
            
            call check(nf90_get_att(file_ncid, &
                    ncdr_files(file_ncdr_id)%vars(var_index)%var_id, &
                    attr_name, &
                    attr_stor))
        end subroutine nc_diag_read_id_get_attr_1d_double
        
        subroutine nc_diag_read_noid_get_attr_1d_double(var_name, attr_name, attr_stor)
            character(len=*), intent(in)             :: var_name
            character(len=*), intent(in)             :: attr_name
            real(r_double), dimension(:), allocatable, intent(inout) :: attr_stor
            
            call ncdr_check_current_ncdr_id
            call nc_diag_read_id_get_attr_1d_double(current_ncdr_id, var_name, attr_name, attr_stor)
        end subroutine nc_diag_read_noid_get_attr_1d_double
        
        subroutine nc_diag_read_id_get_attr_1d_string(file_ncdr_id, var_name, attr_name, attr_stor)
            integer, intent(in)                        :: file_ncdr_id
            character(len=*), intent(in)               :: var_name
            character(len=*), intent(in)               :: attr_name
            character(len=:),allocatable,intent(inout) :: attr_stor
            
            integer(i_long)                            :: var_index, attr_len, attr_type, file_ncid
                        
            call ncdr_check_ncdr_id(file_ncdr_id)
            
            file_ncid = ncdr_files(file_ncdr_id)%ncid
            call ncdr_check_ncid(file_ncid)
            
            var_index = nc_diag_read_id_assert_var(file_ncdr_id, var_name)
            call nc_diag_read_id_assert_attr(file_ncdr_id, var_index, attr_name, attr_type, attr_len)
            
            call nc_diag_read_assert_attr_type(attr_type, NF90_CHAR)
            
            call nc_diag_read_assert_dims(attr_stor, (/ attr_len /))
            
            call check(nf90_get_att(file_ncid, &
                    ncdr_files(file_ncdr_id)%vars(var_index)%var_id, &
                    attr_name, &
                    attr_stor))
        end subroutine nc_diag_read_id_get_attr_1d_string
        
        subroutine nc_diag_read_noid_get_attr_1d_string(var_name, attr_name, attr_stor)
            character(len=*), intent(in)             :: var_name
            character(len=*), intent(in)             :: attr_name
            character(len=:),allocatable,intent(inout) :: attr_stor
            
            call ncdr_check_current_ncdr_id
            call nc_diag_read_id_get_attr_1d_string(current_ncdr_id, var_name, attr_name, attr_stor)
        end subroutine nc_diag_read_noid_get_attr_1d_string
end module ncdr_attrs_fetch
