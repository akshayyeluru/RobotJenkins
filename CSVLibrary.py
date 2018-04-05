import xlrd


class CSVLibrary(object):
    def read_csv_file(self, path):
        book = xlrd.open_workbook(path)
        first_sheet = book.sheet_by_index(0)
        numrowss = first_sheet.nrows
        numcolss = first_sheet.ncols
        result_data = []
        headers = []
        # Forming headers
        for j in range(0, numcolss):
            headers.append(first_sheet.cell_value(0, j))

        for curr_row in range(1, numrowss):
            row_data = []
            emp_data = {}
            for curr_col in range(0, numcolss):
                data = first_sheet.cell_value(curr_row, curr_col)  # Read the data in the current cell
                head = headers[curr_col]
                emp_data[head.encode('ascii')] = str(data).encode('ascii')
            result_data.append(emp_data)
        return result_data
