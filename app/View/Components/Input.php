<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Input extends Component
{
    public string $title;
    public string $name;
    public string $type;
    public string $placeholder;
    public string $value;

    /**
     * Create a new component instance.
     */
    public function __construct(
        string $title,
        string $name,
        string $type = 'text',
        string $placeholder = '',
        string|null $value = ''
    ) {
        $this->title = $title;
        $this->name = $name;
        $this->type = $type;
        $this->placeholder = $placeholder;
        $this->value = $value ?? '';
    }


    /**
     * Get the view / contents that represent the component.
     */
    public function render()
    {
        return view('components.input');
    }
}
