use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Telephony::CountryDialingCodes',
    'VERSION_FROM' => 'lib/Telephony/CountryDialingCodes.pm',
    'AUTHOR' => 'Craig Manley',
    'ABSTRACT' => 'International dialing code to country code conversion class.',
    'PREREQ_PM'	=> {},
    'dist' => {COMPRESS => 'gzip -9f', SUFFIX => 'gz'}
);
