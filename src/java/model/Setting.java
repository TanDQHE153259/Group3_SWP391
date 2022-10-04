/*
 * Copyright 2022 Fangl
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Fangl
 * which accompanies this distribution, and is available at
 * https://github.com/fanglong-it
 *
 * Contributors:
 *    Fangl - initial API and implementation and/or initial documentation
 */
package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Fangl
 */
@Builder
@Getter
@Setter
@ToString
@AllArgsConstructor
public class Setting {

    private int settingId;
    private String name;
    private String description;
    private String value;
    private String typeId;
    private boolean status;

}
