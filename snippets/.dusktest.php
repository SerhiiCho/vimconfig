    /**
    * @test
    */
    public function example(): void
    {
        $this->browse(function ($browser) {
            $browser->visit('/');
            
        });
    }
