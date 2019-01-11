use Spreadsheet::WriteExcel;
open (input_file, "/nfs/site/stod/stod2092vs/w.mraichux.100/trash/ww51/OUTPUT/main_input.txt");
@data=<input_file>;
close(input_file);
# Create a new Excel workbook
my $workbook = Spreadsheet::WriteExcel->new('perl.xls');

# Add a worksheet
$worksheet = $workbook->add_worksheet();

#  Add and define a format
$format = $workbook->add_format(); # Add a format
$format->set_bold();
$format->set_color('red');
$format->set_align('center');


$count=0;
foreach(@data)
{
  $worksheet->write($count, 0, "$data[$count]");
  $worksheet->write($count, 1, "$count");
$count++;
}


$count=0;
foreach(@data)
{
  $worksheet->write($count, 5, "$data[$count]");
$count++;
}
